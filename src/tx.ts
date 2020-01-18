;(async () => {
  const Tx = require("ethereumjs-tx").Transaction
  const Web3 = require("web3")
  const web3 = new Web3("https://ropsten.infura.io/v3/d1d21a61b32a4f669b1438e9218cc279")

  const account = "0x09893Aad261abE088c0fB516990b66D08c2F05f9"
  const privateAccountString = "CCBF88AC64D9755A5CC5298E201920262DA425094C08F95D2ABA0E69AEEFFC92"
  const bufferOfPrivateKey = Buffer.from(privateAccountString, "hex")

  const smartContractAddress = "0x15B942C0229693a35f4452aeF91657602984AC74"
  const ABI = [
    {
      constant: false,
      inputs: [
        {
          internalType: "string",
          name: "_message",
          type: "string"
        }
      ],
      name: "setMessage",
      outputs: [],
      payable: false,
      stateMutability: "nonpayable",
      type: "function"
    },
    {
      constant: true,
      inputs: [],
      name: "getMessage",
      outputs: [
        {
          internalType: "string",
          name: "",
          type: "string"
        }
      ],
      payable: false,
      stateMutability: "view",
      type: "function"
    }
  ]
  const smartContract = new web3.eth.Contract(ABI, smartContractAddress)
  const txCount = await web3.utils.toHex(web3.eth.getTransactionCount(account))

  const txData = {
    nonce: txCount,
    gasLimit: web3.utils.toHex(800000),
    gasPrice: web3.utils.toHex(web3.utils.toWei("10", "gwei")),
    to: smartContractAddress,
    data: smartContract.methods.setMessage("1234567890111").encodeABI()
  }
  const tx = await new Tx(txData, { chain: "ropsten" })
  await tx.sign(bufferOfPrivateKey)
  const serializesTx = tx.serialize()
  const raw = "0x" + serializesTx.toString("hex")
  web3.eth.sendSignedTransaction(raw, (err: any, txHash: string) => console.log(txHash, err))
  // smartContract.methods.getMessage().call((e: any, x: string) => console.log(x, e))
})()
