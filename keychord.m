NoteC=noteX(0.7, 40, 2);
NoteF=noteX(0.5, 45, 2);
NoteG=noteX(0.5, 47, 2);
NoteA=noteX(0.5, 49, 2);
NoteD=noteX(0.5, 54, 2);
 
Csus469_org = NoteC+NoteF+NoteG+NoteA+NoteD;
Csus469 = Csus469_org./max(abs(Csus469_org));
%sound(Ctriad,11025); 
audiowrite('Csus469.wav', Csus469,11025); 

