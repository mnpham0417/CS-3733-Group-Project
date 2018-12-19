drop table Meeting;
drop table Schedule;
drop table ScheduleDate;
drop table TimeSlot;

create table Schedule(
	scheduleID varchar(30),
    secretKey varchar(30),
    name varchar(30),
    startTime int,
    endTime int,
    meetingLength bigint,
	dateCreated timestamp,
    constraint ScheduleID_PK primary key (scheduleID)
);

create table ScheduleDate(
	dateID varchar(30),
    Date timestamp,
    scheduleID varchar(30),
	constraint DateID_PK primary key (dateID),
    constraint ScheduleID_FK foreign key (scheduleID) references Schedule(scheduleID) on delete cascade
);

create table TimeSlot(
	timeSlotID varchar(30),
    startTime time,
    meetingLength bigint,
    date timestamp,
   --  meetingID varchar(30) references Meeting(meetingID) on delete cascade,
    DateID varchar(30),
    organizerAvailable int(1) check (organizerAvailable = 0 or organizerAvailable = 1),
    constraint timeSlotID_PK primary key (timeSlotID),
    constraint ScheduleDate_FK foreign key (DateID) references ScheduleDate(dateID) on delete cascade
);

create table Meeting(
	MeetingID varchar(30),
	timeSlotID varchar(30),
    participantName varchar(30),
    secretKey varchar(30),
    constraint Meeting_PK primary key (MeetingID)
);

alter table Meeting add constraint Meeting_x_TimeSlot Foreign Key (timeSlotID) references TimeSlot(timeSlotID) on delete cascade;