function [BER_qam, BER_enc, SNR] = ofdm_simulator(bitlenght, iterations)
%REED_SOLOMON_SIMULATOR Summary of this function goes here
%   Detailed explanation goes here

% Bitlenght is multiplied with 1496 to make sure each message is divisible
% by both 8 and 187 to fit everything into exactly one GF- element.
bitlenght = bitlenght * 1496;
bits = round(rand(1, bitlenght));
bitre = reshape(bits, bitlenght/8, 8);
m = 8;
% every set of 8 bits is saved on data-array
for i = 1:bitlenght/8
    data(i,:) = bitre(i,:);
end
for i = 1:bitlenght/187
    for j = 1:187
        %each set of 8 bits is converted into an decimal for generating the
        %Galois Field array
        codeword(j) = bi2de(data(j,:));
    end
    %total of 8 codewords are stored per row of the GF array.
    gf_arr(i,:) = codeword;
end
cw_lenght = size(gf_arr, 1);
for j = 1:iterations
    dB = -15 + j
    % Initializing the matrices for the calculations with next SNR -value.
    bit_array_enc1 = [];
    bit_array_enc2 = [];
    bit_array_qam1 = [];
    bit_array_qam2 = [];
    for i = 1:(cw_lenght/8)
        %Adding four numbers to the beginning of the vector
        QAM_vector = [0 0 0 0];
        modulated = [];
        data_array = [];
        encode_array = [];
        receive_array = [];
        decode_array = [];
        %Parsing through the next four messages and arraging the
        %QAM-modulated values from the next messages into one array
        while(length(modulated)<1020)
            data = gf(gf_arr(i,:), m);
            encoded = rsenc(data, 255, 187);
            modulated = [modulated, qammod(encoded.x, 256)];
            data_array = [data_array, data];
            encode_array = [encode_array, encoded];
            i = i + 1;
        end
        %Adding the array of 1024 QAM-constellation points to a vector.
        QAM_vector = [QAM_vector, modulated];
        sent = channel(QAM_vector, dB);
        %removing the padding bits
        decoded = [];
        QAM_vector(1:4) = [];
        for k = 1:4

            %splitting the vector into a four messages and demodulating and
            %decoding each message. Values are stored in variables for BER
            %calculations.
            received1 = qamdemod(sent(1+4:255+4), 256);
            received2 = qamdemod(sent(256+4:510+4), 256);
            received3 = qamdemod(sent(511+4:765+4), 256);
            received4 = qamdemod(sent(766+4:1020+4), 256);
            reencoded1 = gf(received1, m);
            reencoded2 = gf(received2, m);
            reencoded3 = gf(received3, m);
            reencoded4 = gf(received4, m);
            decoded1 = rsdec(reencoded1, 255, 187);
            decoded2 = rsdec(reencoded2, 255, 187);
            decoded3 = rsdec(reencoded3, 255, 187);
            decoded4 = rsdec(reencoded4, 255, 187);
            %these arrays are used for calculating the BER.
            receive_array = [received1, received2, received3, received4];
            decode_array = [decoded1, decoded2, decoded3, decoded4];
        end
        % All the data is stored into temporary matrices for BER
        % calculations
        bit_array_enc1 = [bit_array_enc1; de2bi(data_array.x)];
        bit_array_enc2 = [bit_array_enc2; de2bi(decode_array.x)];
        bit_array_qam1 = [bit_array_qam1; de2bi(encode_array.x)];
        bit_array_qam2 = [bit_array_qam2; de2bi(receive_array)];
        
    end
    SNR(j) = dB;
    [BERerr_enc, Bratio] = biterr(bit_array_enc1, bit_array_enc2)
    [BERerr_qam, Qratio] = biterr(bit_array_qam1, bit_array_qam2)
    BER_enc(j) = Bratio
    BER_qam(j) = Qratio
end
end

