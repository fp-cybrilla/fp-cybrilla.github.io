#### Q - Is it mandatory for the user to place an investment order along with completing the video KYC? 
Yes. An investment order shall have to be placed with the AMC that the distributor has partnered with for completing the KYC.


#### Q - Can the order be placed in a zero balance folio? 
No. As per the fund schemes displayed by the distributor, the investor has to make an investment for the minimum required amount.

#### Q - Is the user allowed to place an order in any scheme (liquid/equity/debt)? 
Yes

#### Q - What is the cut off time for processing the KYC request?
- Transaction orders along with KYC requests received till cut off time of 3 PM shall be processed on the same day, ie, T
- Transaction orders along with KYC requests received post 3 PM shall be processed on T+1 day

#### Q - Can the existing transaction order be maintained in pending state, while the user can submit a fresh KYC request on T+1?<br>
No. A new KYC request and transaction order shall have to be created.

#### Q - How can the distributor check the status of the KYC request for the user?
The distributor can use the [check KYC status](https://fintechprimitives.com/api/#get-get-video-kyc-request).
- For liquid schemes at 4.30 PM on T day. If the status is “rejected”, the KYC request and transaction order can be marked as failed.
- For equity and debt schemes at 8.30 PM on T day. If the status is “rejected”, the KYC request and transaction order can be marked as failed.

#### Sample video
<video width="320" height="240" controls>
  <source src="../../sample_video_kyc.mov" type="video/mp4">
</video>
<br><i>* The data in this video has been created for demo purpose only. It does not belong to any living individual.</i>