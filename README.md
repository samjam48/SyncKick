# SyncKick

_SyncKick is a tool to listen to podcasts and audio in ‘sync’ with your friends and enable real conversations around the content you love._

Listening to content is an often lonely pursuit where you just listen to things in your own world, disconnected from your friends. It is hard to talk to friends about things when they listen to something you listened to three months later (or never). SyncKick allows users to listen to audio (podcasts, books and music) in sync and encourage conversation with real people and be less lonely.

Users can listen at the exact same time or catch up on things the other has listened to and stay in sync. Kicking awesome 😝

## Demo

Live demo can be found here https://synckick.herokuapp.com/

## Prototype

[Figma prototype](https://www.figma.com/file/4X5UDFJBqWLyeUVVUzfM7b/SyncBliss-Mocks?node-id=4%3A78)

## Tech

Initial micro MVP is in React, Express with a PSQL db.
We plan to venture into using TypeScript and React Native for the mvp app release.

## Database

We kept the database simple and faked users and didn't think about subscribing to different podcasts. We just focused on a user being connected to a piece of content and marking in the database their position and current listening status as live or not so others could hypothetically listen at same time or listen up to the same point.

See diagram here - https://dbdiagram.io/d/5e87636c4495b02c3b893797


## Collaboration

Interested in helping out? Join the Hack The Press [slack group](https://app.slack.com/client/TL79RUFHP/) and talk to [Sam Harris](https://www.linkedin.com/in/sharris48/)

## Made at HackThePress

This project was made at the [HackThePress 2019 Hackathon](https://www.hackthepress.org/2019-hackathon/) in London.
The event and development was sponsored by:

| [Aplisay](https://www.aplisay.com/)                                                                                                          | Caliu                                                                                                                                       | [Newspeak House](https://newspeak.house/)                                                                                                |
| -------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| <img src="https://res.cloudinary.com/simms-reeve/image/upload/v1568555139/aplisay-logo_qp4ii5.svg" alt="Aplisay Logo" style="width:200px;"/> | <img src="https://res.cloudinary.com/simms-reeve/image/upload/v1568555163/Asset_10caliu_jc66fd.svg" alt="Caliu Logo" style="width:200px;"/> | <img src="https://pbs.twimg.com/profile_images/599530591386804224/fBztcZ41_400x400.png" alt="Newspeak House Logo" style="width:200px;"/> |
