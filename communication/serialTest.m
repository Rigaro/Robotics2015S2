s = serial('COM5');
set(s,'BaudRate',9600);
fopen(s);
fprintf(s,1)
data = fscanf(s)
fclose(s);
delete(s);