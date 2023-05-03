package nft_store

import (
	"std"
	"strconv"

	"gno.land/p/demo/avl"
	"gno.land/p/demo/grc/grc721"
)


type Listing struct{

	listid			int
	id 				IGRC721.tokenID
	price 			std.Coins
	description 	string
	seller			std.Address

}

func NewListing(
	listid int,
	id IGRC721.tokenID,
	price std.Coins,
	description string,
	seller std.Address,
) *Listing {
	return &Listing{
		listid: listid,
		id: id,
		price: price,
		description: description,
		seller: seller,
	}
}

func (l Listing) GetID() int {
	return l.listid
}

func (l Listing) GetTID() IGRC721.tokenID {
	return l.id
}

func (l Listing) GetDescription() string {
	return l.description
}

func (l Listing) GetPrice() std.Coins {
	return l.price
}

func (l Listing) GetSeller() std.Address {
	return l.seller
}

func (l listing) GetListing() *Listing {
	return l
}