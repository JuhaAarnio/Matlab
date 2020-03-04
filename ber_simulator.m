function [BER, SNR] = ber_simulator(bitlenght, iterations, c)
bits = round(rand(1, bitlenght));
bits = reshape(bits,bitlenght/2,2);
mbit = modulate(bits, bitlenght, c);
for i= 1:iterations
    snr = -5 + (i * 0.5)
    sent = awgn(mbit, snr, 'measured');
    received = demodulate(sent, bitlenght, c);
    int_arr = [bi2de(bits), bi2de(received)]
    ber = ber_calculator(int_arr, bitlenght/2);
    BER(i) = ber; 
    SNR(i) = snr
end
end

