--задание 1
create table Медперсонал (
	идентификатор serial primary key,
	фамилия varchar(50) not null,
	адрес varchar(100),
	налог_percent numeric(5,2) check (налог_percent >= 0) not null
);

create table Место_работы (
    идентификатор serial primary key,
    учреждение varchar(100) not null,
    адрес varchar(100),
    отчисление_percent numeric(5, 2) check (отчисление_percent >= 0) not null
);

create table  Типы_операций (
    идентификатор serial primary key,
    наименование varchar(100) not null,
    опорный_пункт varchar(100),
    запасы integer check (запасы >= 0) not null,
    стоимость numeric(10, 2) check (стоимость >= 0) not null
);

create table  Трудовая_деятельность (
    договор integer primary key,
    дата varchar(50),
    медперсонал_id integer references Медперсонал(идентификатор) on delete cascade,
    место_работы_id integer references Место_работы(идентификатор) on delete cascade,
    операции_id integer references Типы_операций(идентификатор) on delete cascade,
    количество integer check (количество > 0) not null,
    оплата numeric(10, 2) check (оплата >= 0) not null
);

