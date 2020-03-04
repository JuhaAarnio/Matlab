function [bitm] = modulate(bitr, bitlenght,c)
for b = 1:bitlenght/2
    if bitr(b,1) == 0 & bitr(b,2) == 0 
        bitm(b) = c(1);
    end
    if bitr(b,1) == 0 & bitr(b,2) == 1
        bitm(b) = c(2);
    end
    if bitr(b,:) == 1 & bitr(b,2) == 0
        bitm(b) = c(3);
    end
    if bitr(b,:) == 1 & bitr(b,2) == 1
        bitm(b) = c(4);
    end
end

