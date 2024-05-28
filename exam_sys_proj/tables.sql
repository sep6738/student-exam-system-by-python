create table broadcast
(
    broadcastID int auto_increment
        primary key,
    content     varchar(255) null,
    duringTime  varchar(255) null,
    courseID    varchar(255) null
);

create table exam_pool
(
    epID           int auto_increment
        primary key,
    examID         int null,
    questionID     int null,
    questionNumber int null
);

create index exam_pool_examID_index
    on exam_pool (examID);

create table homework_or_exam_pool
(
    hepID           int auto_increment
        primary key,
    type            varchar(255) null,
    question        json         null,
    answer          json         null,
    courseName      varchar(255) null,
    difficultyLevel int          null,
    knowledgePoint  int          null,
    isActive        bit          null,
    kpID            int          null,
    constraint homework_or_exam_pool_exam_pool_examID_fk
        foreign key (hepID) references exam_pool (examID)
);

alter table exam_pool
    add constraint exam_pool_homework_or_exam_pool_hepID_fk
        foreign key (questionID) references homework_or_exam_pool (hepID)
            on delete cascade;

create index homework_or_exam_pool_hepID_index
    on homework_or_exam_pool (hepID);

create table knowledge_points
(
    kpID    int auto_increment
        primary key,
    kpName  varchar(255) null,
    subject varchar(255) null
);

create table hep_and_kp_mediater
(
    mediaterID int auto_increment
        primary key,
    hepID      int null,
    kpID       int null,
    constraint hep_and_kp_mediater_homework_or_exam_pool_hepID_fk
        foreign key (hepID) references homework_or_exam_pool (hepID),
    constraint hep_and_kp_mediater_knowledge_points_kpID_fk
        foreign key (kpID) references knowledge_points (kpID)
);

create table role
(
    roleID   int auto_increment
        primary key,
    roleName varchar(255) null
);

create table users
(
    userID   int auto_increment
        primary key,
    userName varchar(255) null,
    passWord varchar(20)  null,
    name     varchar(255) null,
    roleID   int          null,
    createAt varchar(255) null,
    updateAt varchar(255) null,
    constraint users_role_roleID_fk
        foreign key (roleID) references role (roleID)
            on delete set null
);

create table broadcast_show
(
    broadcastShowID int auto_increment
        primary key,
    userID          int null,
    broadcastID     int null,
    isActive        bit null,
    constraint broadcast_show_broadcast_broadcastID_fk
        foreign key (broadcastID) references broadcast (broadcastID),
    constraint broadcast_show_users_userID_fk
        foreign key (userID) references users (userID)
);

create table teacher_course
(
    courseID   int auto_increment
        primary key,
    userID     int          null,
    semester   varchar(255) null,
    time       varchar(255) null,
    courseName varchar(255) null,
    isActive   bit          null,
    class_     int          null,
    constraint teacher_course_users_userID_fk
        foreign key (userID) references users (userID)
);

create table b_and_tc_mediater
(
    mediaterID  int auto_increment
        primary key,
    broadcastID int null,
    courseID    int null,
    constraint b_and_tc_mediater_broadcast_broadcastID_fk
        foreign key (broadcastID) references broadcast (broadcastID),
    constraint b_and_tc_mediater_teacher_course_courseID_fk
        foreign key (courseID) references teacher_course (courseID)
);

create table homework_or_exam
(
    heID               int auto_increment
        primary key,
    courseID           int          null,
    duringTime         varchar(255) null,
    homeworkExamPoolID int          null,
    result             json         null,
    constraint homework_or_exam_homework_or_exam_pool_hepID_fk
        foreign key (homeworkExamPoolID) references homework_or_exam_pool (hepID)
            on delete cascade,
    constraint homework_or_exam_teacher_course_courseID_fk
        foreign key (courseID) references teacher_course (courseID)
);

create table student_course
(
    scID       int auto_increment
        primary key,
    courseName varchar(255)  null,
    userID     int           null,
    semester   varchar(255)  null,
    time       varchar(255)  null,
    grade      decimal(5, 2) null,
    courseID   int           null,
    isDelete   bit           null,
    constraint student_course_teacher_course_courseID_fk
        foreign key (courseID) references teacher_course (courseID),
    constraint student_course_users_userID_fk
        foreign key (userID) references users (userID)
);

create table student_hand_in
(
    studentHandInID int auto_increment
        primary key,
    userID          int           null,
    homeworkExamID  int           null,
    content         json          null,
    upTime          varchar(255)  null,
    score           decimal(5, 2) null,
    teacherComment  varchar(255)  null,
    resultDetails   json          null,
    constraint student_hand_in_homework_or_exam_heID_fk
        foreign key (homeworkExamID) references homework_or_exam (heID),
    constraint student_hand_in_users_userID_fk
        foreign key (userID) references users (userID)
            on delete cascade
);
