function Out = Cipher(key,In)

Nk=length(key)/8;
In=reshape(In,1,[])';
w=KeyExpansion(key,Nk);
state=reshape(In,4,[]);
state=AddRoundKey(state,w(:,1:4));

for k=2:(Nk+6)
    state=SubBytes(state);
    state=ShiftRows(state);
    state=MixColumns(state);
    state=AddRoundKey(state,w(:,4*(k-1)+1:4*k));
end

state=SubBytes(state);
state=ShiftRows(state);
state=AddRoundKey(state,w(:,4*(Nk+6)+1:4*(Nk+7)));

Out=state(:);
Out=(Out(1:length(In)))';
Out=Out(:)';

end
