# PushType demo

This app demonstrates some common patterns and solutions for structuring and modeling content using PushType. It emulates a basic WordPress site to show how a simple blog can be created very easily.

## How to use this demo

The demo can be deployed to Heroku for free:

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/pushtype/push_type_demo)

Oncee the app is launched, browse the site and review the code in this repository (*and read the comments*) to learn how it works.

1. Take a look at all the models to learn how node types and custom fields are used to model the content and define how different types of content are related.
2. Read through the `ApplicationController` to understand how before and after filters are used to execute code and load additional content around PushType's render action.
3. Explore the views to see how different content types have their own templates - which are just plain old Rails views.

## Signing in to PushType

You can sign in to the PushType admin UI by entering the following address into your browser:

    http://<YOUR APP>.herokuapp.com/admin

Email: `admin@example.com`
Password: `pushtype`

If you are hosting the site on Heroku, be mindful that any images and other media uploaded will not be persisted after a restart. Also no email service is configured.

## Theme

The default WordPress theme (Twenty Seventeen) has been used to show how a simple WordPress-like site can be achieved.

The Twenty Seventeen theme is distributed under the terms of the [GNU GPL](https://opensource.org/licenses/GPL-2.0).
*Twenty Seventeen WordPress Theme, © Copyright 2017 WordPress.org*
