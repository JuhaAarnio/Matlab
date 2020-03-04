function [BER] = ber_calculator(BerArr, bitlenght)
errors=0;
for i = 1:bitlenght/2
    if BerArr(i,1) ~= BerArr(i,2)
        errors = errors + 1;
    end
end
errors
BER = errors/(bitlenght/2)
end

