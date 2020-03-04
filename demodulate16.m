function [dbits] = demodulate16(bitm, bitlenght, c)
    for b = 1:bitlenght/4
        distance1 = norm(bitm(b)-c(1));
        distance2 = norm(bitm(b)-c(2));
        distance3 = norm(bitm(b)-c(3));
        distance4 = norm(bitm(b)-c(4));
        distance5 = norm(bitm(b)-c(5));
        distance6 = norm(bitm(b)-c(6));
        distance7 = norm(bitm(b)-c(7));
        distance8 = norm(bitm(b)-c(8));
        distance9 = norm(bitm(b)-c(9));
        distance10 = norm(bitm(b)-c(10));
        distance11 = norm(bitm(b)-c(11));
        distance12 = norm(bitm(b)-c(12));
        distance13 = norm(bitm(b)-c(13));
        distance14 = norm(bitm(b)-c(14));
        distance15 = norm(bitm(b)-c(15));
        distance16 = norm(bitm(b)-c(16));
        distances = [distance1;distance2;distance3;distance4;distance5;distance6;distance7;distance8;
                     distance9;distance10;distance11;distance12;distance13;distance14;distance15;distance16];
        if min(distances) == distance1
            dbits(b,:) = [0 0 0 0];
        end
        if min(distances) == distance2
            dbits(b,:) = [0 0 0 1];
        end
        if min(distances) == distance3
            dbits(b,:) = [0 0 1 0];
        end
        if min(distances) == distance4
            dbits(b,:) = [0 0 1 1];
        end
        if min(distances) == distance5
            dbits(b,:) = [0 1 0 0];
        end
        if min(distances) == distance6
            dbits(b,:) = [0 1 0 1];
        end
        if min(distances) == distance7
            dbits(b,:) = [0 1 1 0];
        end
        if min(distances) == distance8
            dbits(b,:) = [0 1 1 1];
        end
        if min(distances) == distance9
            dbits(b,:) = [1 0 0 0];
        end
        if min(distances) == distance10
            dbits(b,:) = [1 0 0 1];
        end
        if min(distances) == distance11
            dbits(b,:) = [1 0 1 0];
        end
        if min(distances) == distance12
            dbits(b,:) = [1 0 1 1];
        end
        if min(distances) == distance13
            dbits(b,:) = [1 1 0 0];
        end
        if min(distances) == distance14
            dbits(b,:) = [1 1 0 1];
        end
        if min(distances) == distance15
            dbits(b,:) = [1 1 1 0];
        end
        if min(distances) == distance16
            dbits(b,:) = [1 1 1 1];
        end
    end
end