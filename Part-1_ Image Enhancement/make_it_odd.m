function [odd_number] = make_it_odd(number)
%outputs the number if odd or number +1 if even.
odd_number = number + 1 - rem(number, 2);
end