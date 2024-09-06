include .env

build :; forge build

test :; forge test

format :; forge fmt

anvil :; anvil -m 'test test test test test test test test test test test junk' --steps-tracing --block-time 1

deploy:
	@forge script script/DeployToken.s.sol:DeployToken --rpc-url http://localhost:8545 --private-key $(DEFAULT_ANVIL_KEY) --broadcast

deploy-sepolia:
	@@forge script script/DeployToken.s.sol:DeployToken --rpc-url ${SEPOLIA_RPC_URL} --account $(ACCOUNT) --etherscan-api-key $(ETHERSCAN_API_KEY) --broadcast --verify

install:
	@forge install foundry-rs/forge-std@v1.8.2 --no-commit && forge install openzeppelin/openzeppelin-contracts@v5.0.2 --no-commit
