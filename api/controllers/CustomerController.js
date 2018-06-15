/**
 * CustomerController
 *
 * @description :: Server-side actions for handling incoming requests.
 * @help        :: See https://sailsjs.com/docs/concepts/actions
 */
module.exports = {

  /**
   * show all customer
   * @param req
   * @param res
   */
  index: async function (req, res) {

    var users = await Customer.find();

    res.view({
      model: users
    });
  },


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
  },
  /**
   *
   * @param req
   * @param res
   * @returns {Promise<*>}
   */

  edit: async function (req,res) {
    var id = req.param('id');

    if (!id) return res.send("No id specified.",500);
    var customer = await Customer.findOne(id);

    res.view({
      customer: customer
    });
  },
  /**
   *
   * @param req
   * @param res
   * @returns {Promise<*>}
   */
  update : async function (req, res) {
    var params = _.extend(req.query || {}, req.params || {}, req.body || {});
    var id = params.id;

    if (!id) return res.send("No id specified.",500);

    var result = await Customer.update({id:id})
      .set(req.allParams())
      .fetch();

      if(!result) {
        res.redirect('/customer/edit');
      }
      res.redirect('/customer/show/'+id);
  },
  /**
   *
   * @param req
   * @param res
   * @returns {Promise<*>}
   */
  destroy : async function (req, res) {
      var id = req.param('id');
      // sails.log(req.param('id'));
      if (!id) return res.send("No id specified.",500);
      var customer = await Customer.findOne(id);
      if(!customer) {
        return res.send("No customer with that id exists.",404);
      }
      var result = await Customer.destroy(id).fetch();

      if (result.length === 0) {
        return res.send("Delete customer error",500);
      } else {
        return res.redirect('/customer');
      }
  }
};

