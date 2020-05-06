/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     02/05/2020 02:15:38                          */
/*==============================================================*/

CREATE DATABASE archive ;
USE archive;

drop table if exists Archive;

drop table if exists Bureau;

drop table if exists Categorie;

drop table if exists Guichet;

drop table if exists Secteur;

drop table if exists Service;

drop table if exists Utilisateur;

/*==============================================================*/
/* Table: Archive                                               */
/*==============================================================*/
create table Archive
(
   idArchive            int not null,
   Ser_idService        int not null,
   Gui_idGuichet        int not null,
   Uti_idUtilisateur    int not null,
   Cat_idCategorie      int not null,
   nom                  varchar(254),
   date                 datetime,
   taille               int,
   primary key (idArchive)
);

/*==============================================================*/
/* Table: Bureau                                                */
/*==============================================================*/
create table Bureau
(
   idBureau             int not null,
   Sec_idSecteur        int not null,
   nom                  varchar(254),
   primary key (idBureau)
);

/*==============================================================*/
/* Table: Categorie                                             */
/*==============================================================*/
create table Categorie
(
   idCategorie          int not null,
   nom                  varchar(254),
   type                 varchar(254),
   primary key (idCategorie)
);

/*==============================================================*/
/* Table: Guichet                                               */
/*==============================================================*/
create table Guichet
(
   idGuichet            int not null,
   Bur_idBureau         int not null,
   nom                  int,
   primary key (idGuichet)
);

/*==============================================================*/
/* Table: Secteur                                               */
/*==============================================================*/
create table Secteur
(
   idSecteur            int not null,
   nom                  varchar(254),
   ville                varchar(254),
   primary key (idSecteur)
);

/*==============================================================*/
/* Table: Service                                               */
/*==============================================================*/
create table Service
(
   idService            int not null,
   nom                  varchar(254),
   primary key (idService)
);

/*==============================================================*/
/* Table: Utilisateur                                           */
/*==============================================================*/
create table Utilisateur
(
   idUtilisateur        int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   dateNaiss            varchar(254),
   adresse              varchar(254),
   primary key (idUtilisateur)
);

alter table Archive add constraint FK_association1 foreign key (Ser_idService)
      references Service (idService) on delete restrict on update restrict;

alter table Archive add constraint FK_association2 foreign key (Uti_idUtilisateur)
      references Utilisateur (idUtilisateur) on delete restrict on update restrict;

alter table Archive add constraint FK_association3 foreign key (Gui_idGuichet)
      references Guichet (idGuichet) on delete restrict on update restrict;

alter table Archive add constraint FK_association4 foreign key (Cat_idCategorie)
      references Categorie (idCategorie) on delete restrict on update restrict;

alter table Bureau add constraint FK_association6 foreign key (Sec_idSecteur)
      references Secteur (idSecteur) on delete restrict on update restrict;

alter table Guichet add constraint FK_association5 foreign key (Bur_idBureau)
      references Bureau (idBureau) on delete restrict on update restrict;
      
      
      
/*==============================================================/
 Login and PassWord                                             
/==============================================================*/

/* login Admin with password */
CREATE USER 'brahim'@'localhost' IDENTIFIED BY 'yassine';
GRANT ALL PRIVILEGES ON *.* TO 'brahim'@'localhost';
FLUSH PRIVILEGES
