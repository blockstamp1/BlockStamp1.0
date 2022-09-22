'use strict'

const config = require('config')
const core = require('../core')
const store = require('../store')

/**
 * Get a document status.
 */

const obtain = async (hash) => {
  const docAddress = await store.getDigestAddress(hash)

  if (docAddress) {
    const docproof = await store.getDocproof(docAddress)
    return documentStatus(docproof)
  } else {
    return missingStatus()
  }
}

/**
 * Refresh a document status.
 */

const refresh = async (hash) => {
  console.log("Refresh:", hash)
  const docAddress = await store.getDigestAddress(hash)
  console.log("DocAddress:", docAddress);
  if (docAddress) {
    console.log("Doc Address OK!")
    let docproof = await store.getDocproof(docAddress)
    console.log("DocProof:", docproof)
    if (docproof.pending === true) {
      console.log("Pending True")
      docproof = await core.notary.createDocproof(docproof)
      console.log("B2")
    } else if (docproof.blockstamp === undefined) {
      console.log("C")
      docproof = await core.notary.confirmDocproof(docproof)
      console.log("C1")
    }
    console.log("D");
    return documentStatus(docproof)
  } else {
    console.log("H");
    return missingStatus()
  }
}

/**
 * Reply body for a document status.
 */

async function documentStatus (docproof) {
  console.log("E");
  const price = await core.notary.docproofPrice()
  console.log("F");
  return {
    digest: docproof.digest,
    payment_address: docproof.payment_address,
    pending: docproof.pending,
    network: config.get('app.defaultNetwork'),
    success: true,
    timestamp: core.util.formatDate(docproof.timestamp),
    tx: docproof.tx,
    txstamp: core.util.formatDate(docproof.txstamp),
    blockstamp: core.util.formatDate(docproof.blockstamp),
    price: price.satoshis
  }
}

/**
 * Reply body if a document has no status.
 */

function missingStatus () {
  return {
    success: false,
    reason: 'nonexistent'
  }
}

module.exports = {
  obtain,
  refresh
}
