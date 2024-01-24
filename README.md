# ReLer
ReLer is a hypothetical project for the software engineering course at university. It is about a
business idea of monetized redistribution of second hand books.

## The idea
ReLer's customers may donate their books to our staff, acquiring "Lispector's" (our virtual
currency) in the process. If the book meets our quality requirements, it will be made available in
the in-app store. All books of the store are purchasable via Lispector's. So every person is free
to sign up to donate or purchase books.

However, we do offer subscription plans that come with advantages. We have the basic subscription
and the premium subscription. Their benefits include the shipping of "caixinhas": boxes containing
books and other gifts. Premium subscribers may also receive shopping coupons from partner stores.

## The implementation
We have a single dashboard for every user of the application. These include the customers,
regardless of the subscription plan, and our staff, regardless of the role. This dashboard is
implemented with Flutter, a framework for the Dart programming language. The dasboard is only
designed to work in PC screens that are at least 1300 pixels wide.

The infrastructure is provided by Firebase. We are expecting to avoid the need of creating a
back-end code base thanks to the numerous resources provided by Firebase.

The deployed version of our dashboard can be accessed [here](https://reler-sweufrgs.web.app/).
(Still in progress!)
