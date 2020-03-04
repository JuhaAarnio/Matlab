function [BER_qam, BER_enc, SNR] = reed_solomon_simulator(bitlenght, iterations)
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
    bit_array_enc1 = []
    bit_array_enc2 = []
    bit_array_qam1 = []
    bit_array_qam2 = []
    for i = 1:cw_lenght/8
        data = gf(gf_arr(i,:), m);
        encoded = rsenc(data, 255, 187);
        modulated = qammod(encoded.x, 256);
        sent = awgn(modulated, dB, 'measured');
        received = qamdemod(sent, 256);
        reencoded = gf(received, m);
        decoded = rsdec(reencoded, 255, 187);
        % All the data is stored into temporary matrices for BER
        % calculations
        bit_array_enc1 = [bit_array_enc1; de2bi(data.x)];
        bit_array_enc2 = [bit_array_enc2; de2bi(decoded.x)];
        bit_array_qam1 = [bit_array_qam1; de2bi(encoded.x)];
        bit_array_qam2 = [bit_array_qam2; de2bi(received)];
    end
    SNR(j) = dB;
    [BERerr_enc, Bratio] = biterr(bit_array_enc1, bit_array_enc2)
    [BERerr_qam, Qratio] = biterr(bit_array_qam1, bit_array_qam2)
    BER_enc(j) = Bratio
    BER_qam(j) = Qratio
end
end

