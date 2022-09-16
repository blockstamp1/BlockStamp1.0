'use strict'

const core = require('../core')
const store = require('../store')

const chains = require('../chains')
const bitcore = chains.get()
const _ = require('lodash')


const incomingHDPrivateKey = new bitcore.HDPrivateKey(chains.incomingPrivateKey())


/**
 * Perform a document registration.
 */

const register = async (hash) => {
  const docAddress = await store.getDigestAddress(hash)

  if (docAddress) {
    return existingRegistration(hash)
  } else {
    const randomPath = core.wallet.getRandomPath()
    let paymentAddress = "AAA";
    try{
      paymentAddress = incomingHDPrivateKey.deriveNonCompliantChild(randomPath).privateKey.toAddress()
      console.log("PADDRESS:", paymentAddress)
    }catch(err){
      console.log("Error1:", err.message)
    }
    try{
      paymentAddress = incomingHDPrivateKey.deriveChild(randomPath).privateKey.toAddress()
      console.log("PADDRESS:", paymentAddress)
    }catch(err){
      console.log("Error2:", err.message)
    }
    try{
      paymentAddress = incomingHDPrivateKey.derive(randomPath).privateKey.toAddress()
      console.log("PADDRESS:", paymentAddress)
    }catch(err){
      console.log("Error3:", err.message)
    }
    try{
      paymentAddress = incomingHDPrivateKey.toAddress()
      console.log("PADDRESS:", paymentAddress)
    }catch(err){
      console.log("Error4:", err.message)
    }
    try{
      paymentAddress = incomingHDPrivateKey.privateKey.toAddress()
      console.log("PADDRESS:", paymentAddress)
    }catch(err){
      console.log("Error5:", err.message)
    }
    try{
      paymentAddress = incomingHDPrivateKey.toObject().toAddress()
      console.log("PADDRESS:", paymentAddress)
    }catch(err){
      console.log("Error6:", err.message)
    }
    try{
      paymentAddress = incomingHDPrivateKey.toWIF()
      console.log("PADDRESS:", paymentAddress)
    }catch(err){
      console.log("Error7:", err.message)
    }
    try{
      paymentAddress = incomingHDPrivateKey.toJSON().privateKey.toAddress()
      console.log("PADDRESS:", paymentAddress)
    }catch(err){
      console.log("Error8:", err.message)
    }
    
    const registration = await newRegistration(hash, randomPath, paymentAddress)

    await store.putDigestAddress(hash, paymentAddress)
    await store.putDocproof(paymentAddress, registration)

    // TODO: Webhooks should be created here.

    const unconfirmed = _.omit(registration, 'path')
    store.addLatestUnconfirmed(unconfirmed)

    return paymentDetails(hash, paymentAddress)
  }
}

/**
 * Reply body if a document is already registered.
 */

function existingRegistration (hash) {
  return {
    'success': false,
    'reason': 'existing',
    'digest': hash
  }
}

/**
 * A new document registration.
 */

async function newRegistration (hash, childKeyPath, address) {
  const feePerKilobyte = await core.notary.lookupFeePerKb()
  const fee = core.notary.estimateFee()

  return {
    digest: hash,
    path: childKeyPath,
    payment_address: address.toString(),
    pending: true,
    timestamp: new Date(),
    feePerKilobyte: feePerKilobyte,
    fee: fee
  }
}

/**
 * Reply body for a new registration.
 */

function paymentDetails (hash, address) {
  return {
    success: 'true',
    digest: hash,
    pay_address: address.toString(),
    price: chains.documentPrice()
  }
}

module.exports = register
