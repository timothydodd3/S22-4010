  1: package cli
  2: 
  3: //
  4: //import (
  5: //    "fmt"
  6: //
  7: //    "github.com/Univ-Wyo-Education/S21-4010-a04/bsvr/addr"
  8: //    "github.com/Univ-Wyo-Education/S21-4010-a04/bsvr/lib"
  9: //    "github.com/Univ-Wyo-Education/S21-4010-a04/bsvr/transactions"
 10: //    "github.com/pschlump/MiscLib"
 11: //    "github.com/pschlump/godebug"
 12: //)
 13: //
 14: //func (cc *CLI) InstructorSendFundsTransaction(
 15: //    from addr.AddressType, // account to transfer from
 16: //    sig lib.SignatureType, // not used yet - ditital signature - Assignment 5
 17: //    message string, //        not used yet - JSON message - Assignment 5
 18: //    to addr.AddressType, //   account to send funds to
 19: //    amount int, //            Amount of funds to send
 20: //    memo string, //           Memo to add to transaction (Comment)
 21: //) (
 22: //    tx *transactions.TransactionType,
 23: //    err error,
 24: //) {
 25: //    tot := cc.GetTotalValueForAccount(from)
 26: //    if tot < amount {
 27: //        return nil, fmt.Errorf("Insufficient funds")
 28: //    }
 29: //    oldOutputs := cc.GetNonZeroForAccount(from)
 30: //    if db3 {
 31: //        fmt.Printf("%sOld Outputs (Step 1): %s, AT:%s%s\n", MiscLib.ColorYellow, lib.SVarI(oldOutputs), godebug.LF(), MiscLib.ColorReset)
 32: //    }
 33: //    // remvoe inputs from index.
 34: //    fromHashKey := fmt.Sprintf("%s", from)
 35: //    if _, ok := cc.BlockIndex.FindValue.AddrIndex[fromHashKey]; ok {
 36: //        delete(cc.BlockIndex.FindValue.AddrIndex, fromHashKey)
 37: //    }
 38: //    tx = transactions.NewEmptyTx(memo, from)
 39: //    // create inputs into tranaction from "oldOutputs"
 40: //    txIn, err := transactions.CreateTxInputsFromOldOutputs(oldOutputs)
 41: //    if err != nil {
 42: //        return nil, err
 43: //    }
 44: //    if db3 {
 45: //        fmt.Printf("%sNew Inputs (Step 2): %s, AT:%s%s\n", MiscLib.ColorYellow, lib.SVarI(txIn), godebug.LF(), MiscLib.ColorReset)
 46: //    }
 47: //    tx.Input = txIn
 48: //    txOut, err := transactions.CreateTxOutputWithFunds(to, amount)
 49: //    if err != nil {
 50: //        return nil, err
 51: //    }
 52: //    transactions.AppendTxOutputToTx(tx, txOut)
 53: //    change := tot - amount
 54: //    if change > 0 {
 55: //        txOut, err := transactions.CreateTxOutputWithFunds(from, change)
 56: //        if err != nil {
 57: //            return nil, err
 58: //        }
 59: //        transactions.AppendTxOutputToTx(tx, txOut)
 60: //    }
 61: //    return
 62: //}
 63: //
 64: //func (cc *CLI) StudentSendFundsTransaction(
 65: //    from addr.AddressType, // account to transfer from
 66: //    sig lib.SignatureType, // not used yet - ditital signature - Assignment 5
 67: //    message string, //        not used yet - JSON message - Assignment 5
 68: //    to addr.AddressType, //   account to send funds to
 69: //    amount int, //            Amount of funds to send
 70: //    memo string, //           Memo to add to transaction (Comment)
 71: //) (
 72: //    tx *transactions.TransactionType,
 73: //    err error,
 74: //) {
 75: //
 76: //    // ---- Start Student Code -------------------------------------------------------------------------------------
 77: //    // ---- From Chantelle Schlump
 78: //
 79: //    tot := cc.GetTotalValueForAccount(from)
 80: //    if tot < amount {
 81: //        fmt.Println("Insufficient funds\n")
 82: //        return nil, fmt.Errorf("Insufficient funds\n")
 83: //    }
 84: //    oldOutputs := cc.GetNonZeroForAccount(from)
 85: //    if !(len(oldOutputs) == 0) {
 86: //        delete(cc.BlockIndex.FindValue.AddrIndex, fmt.Sprintf("%s", from))
 87: //    }
 88: //    //unusedOutput := cc.BlockIndex.FindValue.AddrIndex[fmt.Sprintf("%s", acct)]
 89: //    NewTrx := transactions.NewEmptyTx(memo, from)
 90: //    tmp, err := transactions.CreateTxInputsFromOldOutputs(oldOutputs)
 91: //    if err != nil {
 92: //        return nil, err
 93: //    }
 94: //    NewTrx.Input = tmp
 95: //    txOut, err := transactions.CreateTxOutputWithFunds(to, amount)
 96: //    if err != nil {
 97: //        return nil, err
 98: //    }
 99: //    transactions.AppendTxOutputToTx(NewTrx, txOut)
100: //    if amount > tot {
101: //        change := amount - tot
102: //        txOut, err := transactions.CreateTxOutputWithFunds(from, change)
103: //        if err != nil {
104: //            return nil, err
105: //        }
106: //        transactions.AppendTxOutputToTx(NewTrx, txOut)
107: //    }
108: //    return
109: //
110: //    // ---- End Student Code -------------------------------------------------------------------------------------
111: //}
