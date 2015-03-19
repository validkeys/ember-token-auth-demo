import Ember from 'ember';

export default Ember.Route.extend({

  actions: {
    signup: function() {
      var _this     = this,
          userProps = this.controllerFor("signup").getProperties("name", "email", "password"),
          user      = this.store.createRecord('user', userProps);

      // create the user
      user.save()
        .then(function(res){

          // authenticate the user
          return _this.get("session")
            .authenticate("simple-auth-authenticator:jwt", { identification: userProps.email, password: userProps.password })
        })
        .then(function(res){
          console.log("Authentication succeeded!", res);
        })
        .catch(function(err){
          console.warn("User creation error", err);
        })
    }
  }

});