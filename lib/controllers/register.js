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
    try{
    const randomPath = core.wallet.getRandomPath()
    console.log('A:', randomPath);
    console.log('A1:', incomingHDPrivateKey);
    console.log("A2:", incomingHDPrivateKey.derive(randomPath));
    console.log("A3:", incomingHDPrivateKey.derive(randomPath).privateKey);
    console.log("A4:", incomingHDPrivateKey.derive(randomPath).privateKey.toAddress());
    const paymentAddress = incomingHDPrivateKey.derive(randomPath).privateKey.toAddress()
    console.log('B:', paymentAddress);
    const registration = await newRegistration(hash, randomPath, paymentAddress)
    console.log('C:', registration);
    await store.putDigestAddress(hash, paymentAddress)
    console.log('D:');
    await store.putDocproof(paymentAddress, registration)
    console.log('E:');

    // TODO: Webhooks should be created here.

    const unconfirmed = _.omit(registration, 'path')
    console.log('F:');
    store.addLatestUnconfirmed(unconfirmed)
    console.log('G:');
    }catch(err){
    console.log('Error:', err.message);
    }
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
