const assert = require("assert")
const Web3 = require("web3")
const ganache = require("ganache-cli")

const web3 = new Web3(ganache.provider())
const compiled = require("../src/compile")

console.log(compiled.abi)

console.log(compiled.evm.bytecode.object)

let accounts: any, inbox: any
beforeEach("Smart Contract", async () => {
  accounts = await web3.eth.getAccounts()
  inbox = await new web3.eth.Contract(compiled.abi).deploy({ data: compiled.evm.bytecode.object }).send({ from: accounts[0], gas: 1000000 })
  console.log(inbox)
})

describe("Inbox", () => {
  it("can get accounts", () => {})
})
