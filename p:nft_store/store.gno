package nft_store

import (
	"std"
	"strconv"

	"gno.land/p/demo/avl"
	"gno.land/p/demo/grc/grc721"
	"gno.land/p/demo/nft_store"

)

type Store struct {

	id uint
	title string
	listings []*Listing
	storeOwner std.Address

}

func NewStore(

	id uint,
	title string,
	storeOwner std.Address,

) *Store {
	return &Store{
		id: id,
		title: title,
		storeOwner: storeOwner,
	}
}

func (s Store) GetID() uint {
	return l.id
}

func (s Store) GetTitle() string {
	return s.title
}

func (s Store) GetSeller() std.Address {
	return s.storeOwner
}

func (s Store) GetListings() []*Listing {
	return s.listings
}

func (s Store) AddListing(list *Listing) {
	s.listings = append(s.listings, list)
} 