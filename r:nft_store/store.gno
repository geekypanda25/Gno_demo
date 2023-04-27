package nft_store

import (
	"strings"
	"std"
	"strconv"

	"gno.land/p/demo/avl"
	"gno.land/p/demo/grc/grc721"
	"gno.land/p/demo/nft_store"
)

var (
	storeAdm std.Address
	items avl.Tree
	counter uint
)

var Listings []Listing

func isAdmin(address std.Address) bool {
	return address == storeAdm 
}

func AddNFT()