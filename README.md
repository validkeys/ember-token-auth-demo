# ember-token-auth-demo

*The goal here is to use Ember-Simple-Auth on the front end and and Rails JWT on the backend. Would also be nice to then extend this to use Torii and Omniauth for social login*

_Resources_:
* (ember-cli-simple-auth-token)[https://github.com/jpadilla/ember-cli-simple-auth-token]

### Logic

User enters email / password on frontend
Front end POSTS to /sessions which looks up the user /password
If found, returns a JWT token containing the user data
Front end then stores the JWT token and adds it to the Authorization Bearer headed on each subsequent request
The backend then has a before_filter :authenticate that looks for the JWT
Returns 401 if not found
If found, JWT.decodes it and sets the current user as the user passed in the token

---

### Steps


1. Start by installing ember-simple auth

```
npm install --save-dev ember-cli-simple-auth
ember generate ember-cli-simple-auth
```

2. Then install ember-cli-simple-auth-token
```
npm install --save-dev ember-cli-simple-auth-token
ember generate simple-auth-token
```

3. Install Torii
```
npm install torii --save-dev
```