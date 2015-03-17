import Ember from 'ember';

export default Ember.Route.extend({

  actions: {
    providerLogin: function(provider) {
      console.log("User wants to login with " + provider);
      this.get('session').authenticate('simple-auth-authenticator:torii', 'facebook-oauth2')
        .then(function(res) {
          console.log("GOT BACK!", res);
        })
    }
  }

});