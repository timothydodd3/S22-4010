  1: package cli
  2: 
  3: //
  4: //import (
  5: //    "encoding/hex"
  6: //    "fmt"
  7: //
  8: //    "github.com/ethereum/go-ethereum/common"
  9: //    "github.com/ethereum/go-ethereum/crypto"
 10: //)
 11: //
 12: //func (cc *CLI) InstructorValidateSignature(addr, sig, msg string) (isValid bool, err error) {
 13: //    _, _, err = VerifySignature(addr, sig, msg) // (recoveredAddress, recoveredPublicKey string, err error) {
 14: //    if err != nil {
 15: //        return // isValid is false.
 16: //    }
 17: //
 18: //    isValid = true
 19: //    return
 20: //}
 21: //
 22: //// VerifySignature takes hex encoded addr, sig and msg and verifies that the signature matches with the address.
 23: //// Pulled form go-ethereum code.
 24: //func VerifySignature(addr, sig, msg string) (recoveredAddress, recoveredPublicKey string, err error) {
 25: //    message, err := hex.DecodeString(msg)
 26: //    if err != nil {
 27: //        return "", "", fmt.Errorf("unabgle to decode message (invalid hex data) Error:%s", err)
 28: //    }
 29: //    if !common.IsHexAddress(addr) {
 30: //        return "", "", fmt.Errorf("invalid address: %s", addr)
 31: //    }
 32: //    address := common.HexToAddress(addr)
 33: //    signature, err := hex.DecodeString(sig)
 34: //    if err != nil {
 35: //        return "", "", fmt.Errorf("signature is not valid hex Error:%s", err)
 36: //    }
 37: //
 38: //    recoveredPubkey, err := crypto.SigToPub(signHash(message), signature)
 39: //    if err != nil || recoveredPubkey == nil {
 40: //        return "", "", fmt.Errorf("signature verification failed Error:%s", err)
 41: //    }
 42: //    recoveredPublicKey = hex.EncodeToString(crypto.FromECDSAPub(recoveredPubkey))
 43: //    rawRecoveredAddress := crypto.PubkeyToAddress(*recoveredPubkey)
 44: //    if address != rawRecoveredAddress {
 45: //        return "", "", fmt.Errorf("signature did not verify, addresses did not match")
 46: //    }
 47: //    recoveredAddress = rawRecoveredAddress.Hex()
 48: //    return
 49: //}
 50: //
 51: //// signHash is a helper function that calculates a hash for the given message
 52: //// that can be safely used to calculate a signature from.
 53: ////
 54: //// The hash is calulcated as
 55: ////   keccak256("\x19Ethereum Signed Message:\n"${message length}${message}).
 56: ////
 57: //// This gives context to the signed message and prevents signing of transactions.
 58: //func signHash(data []byte) []byte {
 59: //    msg := fmt.Sprintf("\x19Ethereum Signed Message:\n%d%s", len(data), data)
 60: //    return crypto.Keccak256([]byte(msg))
 61: //}
