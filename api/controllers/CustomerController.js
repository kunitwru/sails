/**
 * CustomerController
 *
 * @description :: Server-side actions for handling incoming requests.
 * @help        :: See https://sailsjs.com/docs/concepts/actions
 */

module.exports = {


  /**
   * action new : them moi customer
   * @param req
   * @param res
   */
    'new' : function (req, res) {
        res.view();
    },


    create : function (req, res, next) {
        Customer.create(req.params.all(), function customerCreated(err, customer) {
          if(err) {
            return next(err);
          }

          res.redirect('/customer/show/' + customer.id )
        })
    }
};

