# Movie List

An app to browse the most popular movies

## Table of Contents

- [Introduction](#introduction)
- [Technologies](#technologies)
- [Requirements](#requirements)
- [App Structure](#appstructure)
- [Instruction](#instruction)

## Introduction

Movie List displays the trending movies currently based on the Movie Database API.

## Technologies

This project is created with Flutter using the following packages:

- rxdart package
- http package
- url_launcher

## Requirements

Before running the app, it is required that you have these packages installed locally:

- Flutter v1.5.4 ([Follow the guide here](https://flutter.dev/docs/get-started/install))
- Run ```flutter pub get``` inside the app's directory to get neccessary packages
- Run ```flutter run``` to start installing and running the app (both your computer and testing phone must be online)

## Appstructure

The app is built followed the following structure:

Data Provider -> Repository (handling API call and raw data process) -> BLoC (provide state management) -> UI Screen (display interfaces to user)

## Instruction

The main screen displays the list of most popular movies. When reach a third of the list, the movie list will continue displaying (Infinite list).

There's an arrow button on the AppBar to navigate back to top of the app.

You can click on each movie to read the description and watch the trailer.
