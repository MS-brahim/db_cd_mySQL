/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     26/04/2020 11:53:38                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Joueur') and o.name = 'FK_JOUEUR_ASSOCIATI_EQUIPE')
alter table Joueur
   drop constraint FK_JOUEUR_ASSOCIATI_EQUIPE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('association2') and o.name = 'FK_ASSOCIAT_ASSOCIATI_COMPETIT')
alter table association2
   drop constraint FK_ASSOCIAT_ASSOCIATI_COMPETIT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('association2') and o.name = 'FK_ASSOCIAT_ASSOCIATI_JOUEUR')
alter table association2
   drop constraint FK_ASSOCIAT_ASSOCIATI_JOUEUR
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Competition')
            and   type = 'U')
   drop table Competition
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Equipe')
            and   type = 'U')
   drop table Equipe
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Joueur')
            and   name  = 'ASSOCIATION1_FK'
            and   indid > 0
            and   indid < 255)
   drop index Joueur.ASSOCIATION1_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Joueur')
            and   type = 'U')
   drop table Joueur
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('association2')
            and   name  = 'ASSOCIATION2_FK2'
            and   indid > 0
            and   indid < 255)
   drop index association2.ASSOCIATION2_FK2
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('association2')
            and   name  = 'ASSOCIATION2_FK'
            and   indid > 0
            and   indid < 255)
   drop index association2.ASSOCIATION2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('association2')
            and   type = 'U')
   drop table association2
go

/*==============================================================*/
/* Table: Competition                                           */
/*==============================================================*/
create table Competition (
   id                   int                  not null,
   date                 datetime             null,
   score                varchar(254)         null,
   type                 varchar(254)         null,
   arbitre              varchar(254)         null,
   commentateur         varchar(254)         null,
   constraint PK_COMPETITION primary key nonclustered (id)
)
go

/*==============================================================*/
/* Table: Equipe                                                */
/*==============================================================*/
create table Equipe (
   id                   int                  not null,
   nom                  varchar(254)         null,
   classement           varchar(254)         null,
   fondation            int                  null,
   constraint PK_EQUIPE primary key nonclustered (id)
)
go

/*==============================================================*/
/* Table: Joueur                                                */
/*==============================================================*/
create table Joueur (
   id                   int                  not null,
   Equ_id               int                  not null,
   nom                  varchar(254)         null,
   prenom               varchar(254)         null,
   age                  int                  null,
   poste                int                  null,
   poids                int                  null,
   natinalite           varchar(254)         null,
   constraint PK_JOUEUR primary key nonclustered (id),
   constraint AK_IDENTIFIER_1_JOUEUR unique (id)
)
go

/*==============================================================*/
/* Index: ASSOCIATION1_FK                                       */
/*==============================================================*/
create index ASSOCIATION1_FK on Joueur (
Equ_id ASC
)
go

/*==============================================================*/
/* Table: association2                                          */
/*==============================================================*/
create table association2 (
   id                   int                  not null,
   Com_id               int                  not null,
   constraint PK_ASSOCIATION2 primary key (id, Com_id)
)
go

/*==============================================================*/
/* Index: ASSOCIATION2_FK                                       */
/*==============================================================*/
create index ASSOCIATION2_FK on association2 (
id ASC
)
go

/*==============================================================*/
/* Index: ASSOCIATION2_FK2                                      */
/*==============================================================*/
create index ASSOCIATION2_FK2 on association2 (
Com_id ASC
)
go

alter table Joueur
   add constraint FK_JOUEUR_ASSOCIATI_EQUIPE foreign key (Equ_id)
      references Equipe (id)
go

alter table association2
   add constraint FK_ASSOCIAT_ASSOCIATI_COMPETIT foreign key (Com_id)
      references Competition (id)
go

alter table association2
   add constraint FK_ASSOCIAT_ASSOCIATI_JOUEUR foreign key (id)
      references Joueur (id)
go

