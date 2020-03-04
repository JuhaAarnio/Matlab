function [syndrome, decoded] = hamming_decoder(H,bits)
decoded = [0 0 0 0]
for i = 1:106
    syndrome(i,:) = H * bits(i,:)';
    decoded(i,:) = bits(i,1:4);
end
end

