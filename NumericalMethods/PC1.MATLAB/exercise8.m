field1 = 'f1'; field2 = 'f2'; field3 = 'f3'; field4 = 'f4'; 
value1 = {[1 2 3 4 5], [10 20 30], [100 200 300 400]}; 
value2 = {'a', 'b', 'c'}; 
value3 = {pi, pi.^2, pi.^3}; 
value4 = {'first', 'second', ['hello', 'there']};
s = struct(field1,value1, field2,value2, field3,value3, field4,value4); 
size(s)
s(1) 
s(2) 
s(3) 
%s(4) error index must not exceed 3
s 
s(1).f1 
s(1).f3 
s(1).f1(5) 
%s(1).f3(2) error index must not exceed 1
s(2).f1 
s(2).f3 
s(2).f1(3) 
%s(2).f1(5) error index must not exceed 3
%s(2).f3(2) 
s(3).f2 
s(3).f4 
s(3).f4(6) 
sdum = s(2);
for i=1:3 
    s(i) 
end 
s(1).f1(5)=36;
s(1)

name = {'Adam','Bob','Chris','Dan', 'Elmo'};
field1= 'name';
field2= 'student_number';
field3 = 'birthday_date';
student_number = {1,12,13,14,15};
bdays = {[20,01],[21,02],[22,03],[23,04],[24,05]};
students = struct(field1,name,field2,student_number,field3,bdays);
students(4).student_number = 84;
students(3).birthday_date(2)=7;