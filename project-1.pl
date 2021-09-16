start:-
    write("Enter your name:"),
    read(Name),
    write("Hello, "),write(Name),nl,
    q1_1.


q1_1:-q1(Interest),l_1(List1),l_op_1(List1,Interest,List_q1),
    cgpa(List_q1,Result),
    q3(Language),l_2(List2),l_op_2(List2,Language,List_q1,List_q2),
    q4(Like),l_3(List3),l_op_3(List3,Like,List_q2,List_q3),
    q5(Maths),l_4(List4),l_op_4(List4,Maths,List_q3,List_q4),
    q6(Subject),l_5(List5),l_op_5(List5,Subject,List_q4,List_q5),
    q7(Best),l_6(List6),l_op_6(List6,Best,List_q5,List_q6),
    profession(List_q6,Result).


l_op_1(List,Interest,List1):-
    assigner(List,Interest,1,Element),
    assert(info(Element)),
    converter(List1),
    nl.
l_op_2(List,Language,List1,List2):-
    assigner(List,Language,1,Element),
    insert(Element,List1,List2),nl.
l_op_3(List,Like,List1,List2):-
    assigner(List,Like,1,Element),
    insert(Element,List1,List2),nl.
l_op_4(List,Maths,List1,List2):-
    assigner(List,Maths,1,Element),
    insert(Element,List1,List2),
    nl.
l_op_5(List,Subject,List1,List2):-
    assigner(List,Subject,1,Element),
    insert(Element,List1,List2),
    nl.
l_op_6(List,Best,List1,List2):-
    assigner(List,Best,1,Element),
    insert(Element,List1,List2),
    nl.

assigner([Head|_],Index,Index,Head).
assigner([_|Tail],Index,Current,Element):-Current2 is Current + 1,assigner(Tail,Index,Current2,Element).

converter([Head|Tail]):-retract(info(Head)),converter(Tail).
converter([]).

member1(X,[X|_]).
member1(X,[_|T]):-member1(X,T).

insert(X,List,[X|List]).


l_1(List1):-
    List1=[computer_science,design,electronics].

l_2(List1):-
    List1=[c,java,python,kotlin,javascript].

l_3(List1):-
    List1=[research,application].

l_4(List1):-
    List1=[theory_m,application_m,no_m].

l_5(List1):-
    List1=[dbms,network,security,vlsi].

l_6(List1):-
    List1=[problem,working,interface,manager].

q1(Interest):-
    write('Which of the following areas are you most interest in ?'),nl,
    write('1 - Computer Science'),nl,
    write('2 - Design'),nl,
    write('3 - Electronics'),nl,
    read(Interest),nl.

cgpa([Head|_],X):-
    nl,write('Enter the sgpa of '),
    write(Head),nl,
    read(X),nl.

q3(Language):-
    write('You are well versed in which of the following programming languages?'),nl,
    write('1 - C++'),nl,
    write('2 - Java'),nl,
    write('3 - Python'),nl,
    write('4 - Kotlin'),nl,
    write('5 - JavaScript'),nl,
    read(Language),nl.

q4(Like):-
    write('Which of the following do you prefer?'),nl,
    write('1 - Research and Development of new technology'),nl,
    write('2 - Application of existing technology to solve real world problems'),nl,
    read(Like),nl.

q5(Maths):-
    write('Which part of Maths do you like the most?'),nl,
    write('1 - Theoretical Maths based on proofs and reasoning'),nl,
    write('2 - Application based mathematics'),nl,
    write('3 - Do not like Maths at all'),nl,
    read(Maths),nl.

q6(Subject):-
    write('Whcih of the following Computer Science subjects excite you the most?'),nl,
    write('1 - DBMS'),nl,
    write('2 - Computer Networks'),nl,
    write('3 - Network Security'),nl,
    write('4 - VLSI'),nl,
    read(Subject),nl.

q7(Best):-
    write('Which of the following best describes you ?'),nl,
    write('1 - I love problem solving'),nl,
    write('2 - I like to know about the details about the working of the computer'),nl,
    write('3 - I love to design interfaces'),nl,
    write('4 - I am good in leading a group of people'),nl,
    read(Best).

profession(List,Sgpa):-
    member1(computer_science,List),
    Sgpa>8.5,
    member1(python,List),
    member1(application,List),nl,
    write('On a scale of 1 to 10 how would you rate a profession that involves image processing,deep learning and working with tools like Tensorflow
    and Pytorch.'),nl,
    read(Score),nl,
    Score>7,
    write('Well then AI Engineer is just the job for you.').

profession(List,Sgpa):-
    member1(computer_science,List),
    Sgpa>8.5,
    member1(application_m,List),
    member1(application,List),
    member1(java,List),nl,
    write('On a scale of 1 to 10 how would you rate a profession that involves you in the development of softwares for the general public.'),nl,
    read(Score),nl,
    Score>7,
    write('Well then Software Development Engineer is the most suitable profession for you.').

profession(List,Sgpa):-
    member1(design,List),
    Sgpa>8,
    member1(kotlin,List),
    member1(application,List),nl,
    write('On a scale of 1 to 10 how would you rate a job that involves designing amazing interactive applications for the users like you and me.'),
    nl,read(Score),nl,
    Score>7,
    write('Android Developer is the most suitable profession for you.').

profession(List,Sgpa):-
    member1(design,List),
    Sgpa>8,
    member1(javascript,List),
    member1(application,List),nl,
    write('On a scale of 1 to 10 how would you rate a job that involves designing amazing interactive websites for the users like you and me.'),
    nl,read(Score),nl,
    Score>7,
    write('Web Developer is the most suitable profession for you.').

profession(List,Sgpa):-
    member1(computer_science,List),
    Sgpa>8.5,
    member1(python,List),
    member1(development,List),
    member1(application_m,List),nl,
     write('On a scale of 1 to 10 rate your love for the manipulation of big and intrinsic datasets.'),
    nl,read(Score),nl,
    Score>7,
    write('Data Scientist is the most suitable profession for you.').

profession(List,Sgpa):-
    member1(computer_science,List),
    Sgpa>8,
    member1(c,List),
    member1(application,List),member1(problem,List),
    member1(application_m,List),nl,
    write('On a scale of 1 to 10 how excited do you get when you get to solve new and interesting puzzles.'),
    nl,read(Score),nl,
    Score>7,
    write('Well then there cannot be a job better than computer programmer for you').


profession(List,Sgpa):-
    member1(electronics,List),
    Sgpa>8.5,
    member1(application,List),
    member1(application_m,List),nl,
    write('On a scale of 1 to 10 how amazed do you get when you look at the inner functioning of a high tech pc.'),
    nl,read(Score),nl,
    Score>7,
    write('Hardware Engineer is just the profession for your type.').

profession(List,Sgpa):-
    member1(computer_science,List),
    Sgpa>8.5,
    member1(python,List),
    member1(theory,List),
    member1(development,List),nl,
    write('On a scale of 1 to 10 how much do you like to find new things related to AI.'),
    nl,read(Score),nl,
    Score>7,
    write('AI Researcher is the most suitable profession for you.').

profession(List,Sgpa):-
    member1(computer_science,List),
    Sgpa>8.5,
    member1(theory,List),
    member1(development,List),nl,
    write('On a scale of 1 to 10 how much do you like telling you computer experience to some willing to know about it.'),
    nl,read(Score),nl,
    Score>7,
    write('Then Computer Science Professor is the most suitable profession for you.').

profession(List,Sgpa):-
    member1(computer_science,List),
    Sgpa>8.5,
    member1(network,List),nl,
    write('On a scale of 1 to 10 how much do you like knowing about working of the internet.'),
    nl,read(Score),nl,
    Score>7,
    write('Network Administrator is the most suitable profession for you.').

profession(List,Sgpa):-
    member1(computer_science,List),
    Sgpa>7,
    member1(dbms,List),nl,
    write('On a scale of 1 to 10 how much do you like managing databases.'),
    nl,read(Score),nl,
    Score>7,
    write('Then Database Administrator is the most suitable profession for you.').

profession(List,Sgpa):-
    member1(computer_science,List),
    Sgpa>8.5,
    member1(security,List),
    write('On a scale of 1 to 10 how fascinating is finding vulnerabilities in the systems.'),
    nl,read(Score),nl,
    Score>7,
    write('Then Cybersecurity Analyst is the most suitable profession for you.').

profession(List,Sgpa):-
    member1(electronics,List),
    Sgpa>8.5,
    member1(vlsi,List),nl,
    write('On a scale of 1 to 10 how much would you like to design miniature circuits for devices.'),
    nl,read(Score),nl,
    Score>7,
    write('Embedded Systems Engineer is the most suitable profession for you.').

profession(List,Sgpa):-
    member1(design,List),
    Sgpa>8.5,
    member1(interface,List),nl,
     write('On a scale of 1 to 10 how important is the look and feel of the phone for you.'),
    nl,read(Score),nl,
    Score>7,
    write('Well then UI/UX Designer is the most suitable profession for you.').

profession(List,Sgpa):-
    member1(electronics,List),
    Sgpa>8,
    member1(working,List),nl,
     write('On a scale of 1 to 10 how much do you like to analyse the working of the computer.'),
    nl,read(Score),nl,
    Score>7,
    write('System Analyst is the most suitable profession for you.').

profession(List,Sgpa):-
    write("Sorry we could not find a suitable profession for you.Please try again.").










