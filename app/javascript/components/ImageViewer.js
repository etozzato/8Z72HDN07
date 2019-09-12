import React from "react"
import PropTypes from "prop-types"
class ImageViewer extends React.Component {
  render () {
    var imageList = this.props.images.map(function(image){
      return <div><h4>Name: {image.name}</h4> <img alt={image.name} className='thumbnail' thumbnail-id={image.id} src={image.thumbnail}/><h6>{image.published_at}</h6></div>;
    })
    return (
      <React.Fragment>
        <h3>Image Listing</h3>
        <ul>
          <li>
            You have {this.props.total} images
          </li>
          <li>
            <a href={this.props.upload_url}>upload an image</a>
          </li>
        </ul>
        <div>
          <ul>
            {imageList}
          </ul>
        </div>
      </React.Fragment>
    );
  }
}

ImageViewer.propTypes = {
  upload_url: PropTypes.node,
  total: PropTypes.node,
  images: PropTypes.node
};
export default ImageViewer
