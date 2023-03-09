function key = KeyPadding(keyold)

KeyNew =  cast(keyold,'uint8');
KeyLength =size(KeyNew,2);

if KeyLength < 16
    KeyNew = [KeyNew, zeros(1, 16 - KeyLength)];
elseif (KeyLength>16) && (KeyLength<24)
    KeyNew = [KeyNew, zeros(1, 24 - KeyLength)];
elseif (KeyLength>24) && (KeyLength<32)
    KeyNew = [KeyNew, zeros(1, 32 - KeyLength)];
end

key = dec2hex(KeyNew);

end
