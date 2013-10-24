BBShopper
=========

Demo Shopping App

Frameworks Used
=========
- CoreMeta: IOC/DI framework.  https://github.com/jgretz/CoreMeta
- Cereal: Serialization framework.  https://github.com/jgretz/Cereal
- AFNetworking: iOS Networking framework.  https://github.com/afnetworking

Challenges/Blockers Encountered
=========
- checkout/cart API POST Request:  I did not have the httpBody set correctly.  I did spend a few hours trying to work through the issue before reaching out for help. Thanks to Rachel and Chris for assistance in getting this resolved quickly.

- checkout/cart API redirect:  The POST request uses a redirect to provide the updated cart information.  I had not dealt with this before, there was a bit of a learning exercise using the AFNetworking library to handle the redirect.

Time Summary
=========
In total I spent ~14 hours on this project.  About 4-5 hours of those hours were spent working through the challenges and blockers mentioned above.

Notes
=========
Other than testing as I went, I did not employ unit tests in the project.  This would certainly be a beneficial addition especially for testing the API and web services.

I would like to improve the Product related models, specifically the CartProduct model.  I found there were 3 flavors of product data returned through the various APIs.  There is probably room to unify the models a bit.