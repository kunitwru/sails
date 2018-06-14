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
  'new': function (req, res) {
    res.view();
  },
  /**
   * create customer
   * @param req
   * @param res
   */

  create: async function (req, res) {

    var params = _.extend(req.query || {}, req.params || {}, req.body || {});
    var createdUser = await Customer.create(params).fetch();
    if (!createdUser) {
      res.send('Create error', 500);
    }
    res.redirect('/customer/show/' + createdUser.id);
    // sails.log(createdUser.id);
    return;

  },
  /**
   * show detail customer
   * @param req
   * @param
   */
  show: async function (req, res) {
    var id = req.param('id');


    if (!id) return res.send("No id specified.", 500);

    var customer = await Customer.findOne(id);

    if (!customer) return res.send("User " + id + " not found", 404);

    res.view({
      customer: customer
    })
  }
};

