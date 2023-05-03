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
	storeAdm std.Address = "g123w5l0tqtvw9rq385ed60tmjvxk5d2v5kdd2jg"
	listindex int = 0
	desc string = "Test NFT store"
)

func isAdmin(address std.Address) bool {
	return address == storeAdm 
}

func init() {
	s = nft_store.NewStore(storeindex, desc, storeAdm)
}

func AddNFT(
	token IGRC721.tokenID,
	price std.Coins,
	description string,
	seller std.Address,
) {
	n = listing.NewListing(listindex, token, price, description, seller)

	if !s.AddListing(n){
		return "unable to add listing"
	}

	listindex++;

	return "Listing Added"
}

func BuyNFT(id int) {
	list := GetListing(id)
	if list == nil {
		return "not found"
	}

	amount := std.Coins{
		{
			"ugnot",
			list.GetPrice(),
		}
	}

	banker := std.GetBanker(std.BankerTypeRealmSend)

	buyer := std.GetOrigCaller()

	if banker.GetCoins(buyer).AmountOf("ugnot") < list.GetPrice(){
		return "failed buy order"
	}

	banker.SendCoins(std.GetOrigPkgAddr(), storeAdm, amount)

	IGRC721.TransferFrom(IGRC721.OwnerOf(list.GetTID()), buyer, list.GetTID())

	return ufmt.Sprintf{
		"NFT with ID %s sold",
		id
	}

}

func Render(path string) string {

	parts := strings.Split(path, "/")

	switch{
	case path = "":
		return renderListings()
	case len(parts) == 2 && parts[0] == "listings":
		return renderListings()
	default:
		return "Listings not found"
	}

}

func renderListings(listings []*store.Listing) string{

	var b bytes.Buffer

	for _, post :=range listings {
		listingURL := ufmt,Sprintf("%s%s%d", storePrefix, "listing/", store.GetID())
		b.WriteString(
			ufmt.Sprintf("### [%s](%s)\n", store.GetDescription(), listingURL),
		)
	} 
	return b.String()
}