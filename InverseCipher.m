function Out = InverseCipher(key,In)

Nk=length(key)/8;
In=reshape(In,1,[])';
w=KeyExpansion(key,Nk);
state=reshape(In,4,[]);
state=AddRoundKey(state,w(:,4*(Nk+6)+1:4*(Nk+7)));

for k=(Nk+6):-1:2
    state=InverseShiftRows(state);
    state=InverseSubBytes(state);
    state=AddRoundKey(state,w(:,4*(k-1)+1:4*k));
    state=InverseMixColumns(state);
end

state=InverseShiftRows(state);
state=InverseSubBytes(state);
state=AddRoundKey(state,w(:,1:4));

Out=state(:)';
Out=(Out(1:length(In)))';
Out=Out(:)';

end
