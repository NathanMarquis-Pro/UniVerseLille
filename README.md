# SAE 4.02.1 - UniVerseLille

### Créé par Nathan Marquis

## Introduction

Bienvenue dans ce descriptif du projet UniVerseLille ! Ce projet est une plateforme en ligne de discussions instantanées destinée aux usagers de l'Université de Lille.
Dans ce README, vous trouverez toute la procédure de création du projet, de la modélisation, jusqu'aux points techniques difficiles et comment ils ont été réglés.

## Sommaire

- [Description générale](#description-générale-de-lapplication)
- [Modélisation de la Base de donnée](#modélisation-de-la-base-de-donnée)
- [Requêtes sur la Base de donnée](#requêtes-pertinentes-sur-la-base-de-donnée)
- [Arborescence globale de l'application](#arborescence-globale-de-lapplication)
- [Entrées et fonctionnalités des contrôleurs](#entrées-et-fonctionnalités-des-contrôleurs)
- [Difficultés rencontrées et leurs solutions](#difficultés-rencontrées-et-leurs-solutions)

## Description générale de l'application

## Modélisation de la base de donnée

Pour commencer la création d'UniVerseLille, un réseau social web pour l'Université de Lille, j'ai mis en place un modèle conceptuel (MCD) :

![Image_MCD](./WEB-INF/res/MCD_UniVerseLille.png) 

## Requêtes pertinentes sur la Base de donnée

## Arborescence globale de l'application

## Entrées et fonctionnalités des contrôleurs

- Créer un utilisateur (fait)
- Supprimer un utilisateur (fait)
- Se connecter en tant qu'utilisateur (methode isMdpCorrect dans le dao)
- Afficher les informations d'un utilisateur (fait)
- Pouvoir modifier les informations d'un utilisateur
- Afficher les utilisateurs d'un fil (fait)

- Créer un fil (fait)
- Supprimer un fil (fait)
- Afficher les fils disponibles pour un utilisateur (fait)
- Modifier les informations d'un fil si admin

- Créer un nouveau message (fait)
- Afficher les messages d'un fil (fait)
- Répondre à un message existant (se fait surtout dans créer un nouveau message)
- Mettre un like ou l'enlever (fait)
- Modifier un message ?

Pour associer un message et sa réponse : associer avec une hashmap les messages
Pour associer un message avec celui qui l'a écrit : associer les utilisateurs avec leur message

Double hashmap ? Map<Utilisateur,Map<Message,Message>>
Ou alors
Stocker un utilisateur ou un pseudo dans chaque message, et trouver un moyen d'accéder aux dates.
Ça donnerait : Map<Message, Message> avec un utilisateur dans chaque message

## Difficultés rencontrées et leurs solutions