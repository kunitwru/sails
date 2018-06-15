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
    sails.log(createdUser);
    if (!createdUser) {
      res.notFound()
    }
    res.json({'status' : 'OK', 'ID' : createdUser.id});
    // res.redirect('/customer/show/' + createdUser.id);
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


    if (!id) return res.notFound();

    var customer = await Customer.findOne(id);

    if (!customer) return res.notFound();
    res.json({'status' : 'OK', customer});
    return;
    // res.view({
    //   customer: customer
    // })
  },
  /**
   *
   * @param req
   * @param res
   * @returns {Promise<*>}
   */

  edit: async function (req,res) {
    var id = req.param('id');

    if (!id) {
      return res.notFound();
    }
    var customer = await Customer.findOne(id);
    if(!customer) {
      return res.notFound();
    }
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

    if (!id) {
      return res.notFound();
    }

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
      if (!id) {
        return res.notFound();
      }
      var customer = await Customer.findOne(id);
      if(!customer) {
        return res.notFound();
      }
      var result = await Customer.destroy(id).fetch();

      if (result.length === 0) {
        return res.notFound();
      } else {
        return res.redirect('/customer');
      }
  }
};

