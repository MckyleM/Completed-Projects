import hashlib as hasher
import datetime as date

class Block:
    def __init__(self, index, timestamp, data, previous_hash):
        self.index = index
        self.timestamp = timestamp
        self.data = data
        self.previous_hash = previous_hash
        self.hash = self.hash_block()

    def hash_block(self):
        sha = hasher.sha256()
        sha.update((str(self.index) + 
                    str(self.timestamp) + 
                    str(self.data) + 
                    str(self.previous_hash)).encode('utf-8'))
        return sha.hexdigest()

    def __str__(self):
        return f"Block #{self.index}\nHash: {self.hash}\nData: {self.data}\n"
    
def create_genesis_block():
    return Block(0,date.datetime.now(),"Genisis",'0')

def new_block(last_block):
    this_index = last_block.index +1
    this_date = date.datetime.now()
    this_data = "Im a block, my number is " + str(this_index)
    this_hash = last_block.hash_block()
    return Block(this_index,this_date,this_data,this_hash)

blockchain = [create_genesis_block()]
previous_block = blockchain[0]
Total_blocks = 20

for i in range(0,Total_blocks):
    block_to_add = new_block(previous_block)
    blockchain.append(block_to_add)
    print(block_to_add)
    previous_block = block_to_add