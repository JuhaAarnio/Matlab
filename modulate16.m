function [bitm] = modulate16(bitr, bitlenght,c)
for b = 1:bitlenght/4
    if bitr(b,1) == 0 & bitr(b,2) == 0 & bitr(b,3) == 0 & bitr(b,4) == 0
        bitm(b) = c(1);
    end
    if bitr(b,1) == 0 & bitr(b,2) == 0 & bitr(b,3) == 0 & bitr(b,4) == 1
        bitm(b) = c(2);
    end
    if bitr(b,1) == 0 & bitr(b,2) == 0 & bitr(b,3) == 1 & bitr(b,4) == 0
        bitm(b) = c(3);
    end
    if bitr(b,1) == 0 & bitr(b,2) == 0 & bitr(b,3) == 1 & bitr(b,4) == 1
        bitm(b) = c(4);
    end
    if bitr(b,1) == 0 & bitr(b,2) == 1 & bitr(b,3) == 0 & bitr(b,4) == 0
        bitm(b) = c(5);
    end
    if bitr(b,1) == 0 & bitr(b,2) == 1 & bitr(b,3) == 0 & bitr(b,4) == 1
        bitm(b) = c(6);
    end
    if bitr(b,1) == 0 & bitr(b,2) == 1 & bitr(b,3) == 1 & bitr(b,4) == 0
        bitm(b) = c(7);
    end
    if bitr(b,1) == 0 & bitr(b,2) == 1 & bitr(b,3) == 1 & bitr(b,4) == 1
        bitm(b) = c(8);
    end
    if bitr(b,1) == 1 & bitr(b,2) == 0 & bitr(b,3) == 0 & bitr(b,4) == 0
        bitm(b) = c(9);
    end
    if bitr(b,1) == 1 & bitr(b,2) == 0 & bitr(b,3) == 0 & bitr(b,4) == 1
        bitm(b) = c(10);
    end
    if bitr(b,1) == 1 & bitr(b,2) == 0 & bitr(b,3) == 1 & bitr(b,4) == 0
        bitm(b) = c(11);
    end
    if bitr(b,1) == 1 & bitr(b,2) == 0 & bitr(b,3) == 1 & bitr(b,4) == 1
        bitm(b) = c(12);
    end
    if bitr(b,1) == 1 & bitr(b,2) == 1 & bitr(b,3) == 0 & bitr(b,4) == 0
        bitm(b) = c(13);
    end
    if bitr(b,1) == 1 & bitr(b,2) == 1 & bitr(b,3) == 0 & bitr(b,4) == 1
        bitm(b) = c(14);
    end
    if bitr(b,1) == 1 & bitr(b,2) == 1 & bitr(b,3) == 1 & bitr(b,4) == 0
        bitm(b) = c(15);
    end
    if bitr(b,1) == 1 & bitr(b,2) == 1 & bitr(b,3) == 1 & bitr(b,4) == 1
        bitm(b) = c(16);
    end
end
