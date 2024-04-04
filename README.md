<!-- PROJECT LOGO -->
<br />
<div align="center">
  <img src="images/qrfy.jpg" style="display: block;  margin-left: auto;  margin-right: auto;  width: 15%;">
  <h3 align="center">README.MD</h3>

  <p align="center">
    This file contains the instructions to deploy the main database of the QRFY web application.
    <br />
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of contents</summary>
  <ol>
    <li><a href="#introduction">Introduction</a></li>
    <li><a href="#structure">Repository structure</a></li>
    <li><a href="#screenshots">Screenshoots</a></li>
  </ol>
</details>

<!-- INTRODUCTION -->
## Introduction
<div id="introduction"></div>

The aim of this repository is to have the database structure and example or real working data available in order to be able to deploy the database in a local version for development in a few minutes. Through the SQL script structure of the CleanDB folder a complete and functional database can be deployed. Through the versioning SQL script structure in the UpdateDB folder, a team of developers can incorporate changes and enhancements as they are made to integrate into the development or production database through versioning.

<!-- STRUCTURE -->
## Repository structure
<div id="structure"></div>

The folder structure of the repository is distributed as follows:

> *To deploy a new, clean database use the CleanDB folder

> - CleanDB
>    - INSERTS
>        - 1.Users_Roles.sql
>        - 2.Users_Data.sql
>        - 3.Master_Tables.sql

> - BD
>     - 1.new_DB.sql

> *To perform version upgrades on locally deployed databases use the UPDATES folder:
> - UpdateDB

<!-- SCREENSHOTS -->
## Screenshots
<div id="screenshots"></div>

<div id="block" align="center">
    <div class="inline-block" style="display: inline-block; width: 30%">
        <img src="images/docker2.jpg">
    </div>
    <br>
    <div class="inline-block" style="display: inline-block; width: 30%">
        <img src="images/docker3.jpg">
    </div>
    <br>
    <div class="inline-block" style="display: inline-block; width: 30%">
        <img src="images/docker4.jpg">
    </div>
</div>
