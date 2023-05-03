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
	listings avl.tree{}
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
	return s.id
}

func (s Store) GetTitle() string {
	return s.title
}

func (s Store) GetSeller() std.Address {
	return s.storeOwner
}

func (s Store) GetListings() []*Listing {
	lists := make([]*Listing, s.listings.Size())
	index:= 0
	s.listings.Iterate("", "", func(n *avl.Node) bool {
		lists[index] = n.Value().(*Listing)
		return false
	})
	
	return lists
}

func (s Store) GetListing(id uint) Listing {
	listing, found := s.listings.Get(listid)
	
	if !found {
		return nil
	}

	return listing
}

func (s Store) AddListing(list *Listing) {

	_, found := s.listings.Get(ufmt.Sprintf("d", list.GetID()))

	if found {
		return false
	}

	listsraw, found := s.listings.Get(list.GetID())
	lists, _ := listsraw.([]*Listing)
	lists = append(lists, list)

	s.listings.Set(ufmt.Sprintf("%d", list.GetID()), list)

	return true
} 