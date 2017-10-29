# frozen_string_literal: true

class Blockchain
  def initialize()
    @current_transactions = []
    @chain = []
    new_block(previous_hash: 1, proof: 1000)
  end

  def new_transaction(sender, recipient, amount)
    current_transactions.append(
      sender: sender,
      recipient: recipient,
      amount: amount
    )
    last_block['index'] + 1
  end

  def new_block(proof, previous_hash: nil)
    block = {
      index: @chain + 1,
      timestamp: Time.now.to_i,
      transactions: current_transactions,
      proof: proof,
      previous_hash: previous_hash
    }
    current_transactions = []
    chain.append(block)
    block
  end

  def last_block
    chain[-1]
  end

  def hash(block)
    block_string = json.dumps(block, sort_keys: true).encode
    hashlib.sha256(block_string).hexdigest
  end
end
