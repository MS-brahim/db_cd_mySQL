/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     27/04/2020 11:23:14                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Archive') and o.name = 'FK_ARCHIVE_ASSOCIATI_SERVICE')
alter table Archive
   drop constraint FK_ARCHIVE_ASSOCIATI_SERVICE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Archive') and o.name = 'FK_ARCHIVE_ASSOCIATI_UTILISAT')
alter table Archive
   drop constraint FK_ARCHIVE_ASSOCIATI_UTILISAT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Archive') and o.name = 'FK_ARCHIVE_ASSOCIATI_GUICHET')
alter table Archive
   drop constraint FK_ARCHIVE_ASSOCIATI_GUICHET
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Archive') and o.name = 'FK_ARCHIVE_ASSOCIATI_CATEGORI')
alter table Archive
   drop constraint FK_ARCHIVE_ASSOCIATI_CATEGORI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Bureau') and o.name = 'FK_BUREAU_ASSOCIATI_SECTEUR')
alter table Bureau
   drop constraint FK_BUREAU_ASSOCIATI_SECTEUR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Guichet') and o.name = 'FK_GUICHET_ASSOCIATI_BUREAU')
alter table Guichet
   drop constraint FK_GUICHET_ASSOCIATI_BUREAU
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Archive')
            and   name  = 'ASSOCIATION4_FK'
            and   indid > 0
            and   indid < 255)
   drop index Archive.ASSOCIATION4_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Archive')
            and   name  = 'ASSOCIATION3_FK'
            and   indid > 0
            and   indid < 255)
   drop index Archive.ASSOCIATION3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Archive')
            and   name  = 'ASSOCIATION2_FK'
            and   indid > 0
            and   indid < 255)
   drop index Archive.ASSOCIATION2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Archive')
            and   name  = 'ASSOCIATION1_FK'
            and   indid > 0
            and   indid < 255)
   drop index Archive.ASSOCIATION1_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Archive')
            and   type = 'U')
   drop table Archive
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Bureau')
            and   name  = 'ASSOCIATION6_FK'
            and   indid > 0
            and   indid < 255)
   drop index Bureau.ASSOCIATION6_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Bureau')
            and   type = 'U')
   drop table Bureau
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Categorie')
            and   type = 'U')
   drop table Categorie
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Guichet')
            and   name  = 'ASSOCIATION5_FK'
            and   indid > 0
            and   indid < 255)
   drop index Guichet.ASSOCIATION5_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Guichet')
            and   type = 'U')
   drop table Guichet
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Secteur')
            and   type = 'U')
   drop table Secteur
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Service')
            and   type = 'U')
   drop table Service
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Utilisateur')
            and   type = 'U')
   drop table Utilisateur
go

/*==============================================================*/
/* Table: Archive                                               */
/*==============================================================*/
create table Archive (
   idArchive            int                  not null,
   Uti_idUtilisateur    int                  not null,
   Ser_idService        int                  not null,
   Cat_idCategorie      int                  not null,
   Gui_idGuichet        int                  not null,
   nom                  String               null,
   date                 Date                 null,
   taille               int                  null,
   constraint PK_ARCHIVE primary key nonclustered (idArchive)
)
go

/*==============================================================*/
/* Index: ASSOCIATION1_FK                                       */
/*==============================================================*/
create index ASSOCIATION1_FK on Archive (
Ser_idService ASC
)
go

/*==============================================================*/
/* Index: ASSOCIATION2_FK                                       */
/*==============================================================*/
create index ASSOCIATION2_FK on Archive (
Uti_idUtilisateur ASC
)
go

/*==============================================================*/
/* Index: ASSOCIATION3_FK                                       */
/*==============================================================*/
create index ASSOCIATION3_FK on Archive (
Gui_idGuichet ASC
)
go

/*==============================================================*/
/* Index: ASSOCIATION4_FK                                       */
/*==============================================================*/
create index ASSOCIATION4_FK on Archive (
Cat_idCategorie ASC
)
go

/*==============================================================*/
/* Table: Bureau                                                */
/*==============================================================*/
create table Bureau (
   idBureau             int                  not null,
   Sec_idSecteur        int                  not null,
   nom                  String               null,
   constraint PK_BUREAU primary key nonclustered (idBureau)
)
go

/*==============================================================*/
/* Index: ASSOCIATION6_FK                                       */
/*==============================================================*/
create index ASSOCIATION6_FK on Bureau (
Sec_idSecteur ASC
)
go

/*==============================================================*/
/* Table: Categorie                                             */
/*==============================================================*/
create table Categorie (
   idCategorie          int                  not null,
   nom                  String               null,
   type                 String               null,
   constraint PK_CATEGORIE primary key nonclustered (idCategorie)
)
go

/*==============================================================*/
/* Table: Guichet                                               */
/*==============================================================*/
create table Guichet (
   idGuichet            int                  not null,
   Bur_idBureau         int                  not null,
   nom                  int                  null,
   constraint PK_GUICHET primary key nonclustered (idGuichet)
)
go

/*==============================================================*/
/* Index: ASSOCIATION5_FK                                       */
/*==============================================================*/
create index ASSOCIATION5_FK on Guichet (
Bur_idBureau ASC
)
go

/*==============================================================*/
/* Table: Secteur                                               */
/*==============================================================*/
create table Secteur (
   idSecteur            int                  not null,
   nom                  String               null,
   ville                String               null,
   constraint PK_SECTEUR primary key nonclustered (idSecteur)
)
go

/*==============================================================*/
/* Table: Service                                               */
/*==============================================================*/
create table Service (
   idService            int                  not null,
   nom                  String               null,
   constraint PK_SERVICE primary key nonclustered (idService)
)
go

/*==============================================================*/
/* Table: Utilisateur                                           */
/*==============================================================*/
create table Utilisateur (
   idUtilisateur        int                  not null,
   nom                  String               null,
   prenom               String               null,
   dateNaiss            String               null,
   adresse              String               null,
   constraint PK_UTILISATEUR primary key nonclustered (idUtilisateur)
)
go

alter table Archive
   add constraint FK_ARCHIVE_ASSOCIATI_SERVICE foreign key (Ser_idService)
      references Service (idService)
go

alter table Archive
   add constraint FK_ARCHIVE_ASSOCIATI_UTILISAT foreign key (Uti_idUtilisateur)
      references Utilisateur (idUtilisateur)
go

alter table Archive
   add constraint FK_ARCHIVE_ASSOCIATI_GUICHET foreign key (Gui_idGuichet)
      references Guichet (idGuichet)
go

alter table Archive
   add constraint FK_ARCHIVE_ASSOCIATI_CATEGORI foreign key (Cat_idCategorie)
      references Categorie (idCategorie)
go

alter table Bureau
   add constraint FK_BUREAU_ASSOCIATI_SECTEUR foreign key (Sec_idSecteur)
      references Secteur (idSecteur)
go

alter table Guichet
   add constraint FK_GUICHET_ASSOCIATI_BUREAU foreign key (Bur_idBureau)
      references Bureau (idBureau)
go

