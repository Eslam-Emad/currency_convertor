# currency_converter

A new Flutter project.

## Getting Started

to get start with this project you need to install flutter first
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

then need to clone this project.
    
    git clone https://github/...

then run:

    flutter pub get

## Features
* dio 
* dio cache interceptor to store data locally 
* hive as a local data storage
* simple unit test
## App Architecture

<details>
 <summary> bussniess_logic </summary>

	This Folder contains all `BloC`s handling Business Logic and API Requests states
 </details> 


<details>
 <summary> data </summary>

	Models for API requests and Models to help handling the data states, and repositories resbonsilble for handling API requests
 </details> 

<details>
 <summary> presentation</summary>

	Contains Project UI Components (Pages, Widgets, Dialogs, Sheets)

  <details>
  <summary>widgets </summary>

    	This Folder contains the widgets that are shared between pages


   </details>

  <details>
  <summary>pages </summary>

    	This Folder contains All App pages and Screens


   </details>
 </details>





<details>
 <summary> core </summary>

	Contains helper classes and const values and themes
