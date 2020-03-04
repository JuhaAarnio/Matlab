function [dbits] = demodulate(bitm, bitlenght, c)
    for b = 1:bitlenght/2
        distance1 = norm(bitm(b)-c(1));
        distance2 = norm(bitm(b)-c(2));
        distance3 = norm(bitm(b)-c(3));
        distance4 = norm(bitm(b)-c(4));
        distances = [distance1;distance2;distance3;distance4];
        if min(distances) == distance1
            dbits(b,:) = [0 0];
        end
        if min(distances) == distance2
            dbits(b,:) = [0 1];
        end
        if min(distances) == distance3
            dbits(b,:) = [1 0];
        end
        if min(distances) == distance4
            dbits(b,:) = [1 1];
        end
        
    end
end

