import React from "react"
import PropTypes from "prop-types"
class ImageUploader extends React.Component {
  constructor(props) {
    super(props);
    this.state = { error: '', total: props.total, name: 'No Name'}
  }
  render () {
    return (
      <React.Fragment>
        <h3>Image Uploader</h3>
        <ul>
          <li>
            You have {this.state.total} images
          </li>
          <li>
            <a href={this.props.images_url}>back to images</a>
          </li>
        </ul>
        <h5>{this.state.error}</h5>
        <div>
          <label htmlFor='name'>Name of the image*</label>:
          <input type='text' name='name' value={this.state.name} onChange={(event)=> { this.setState({name: event.target.value}) }} />
        </div>
        <div>
          <label htmlFor='file'>Image to upload*</label>:
          <input type='file' name='file' onChange={(event)=> { this.readFile(event.target.files) }} accept="image/png, image/jpeg" />
        </div>
      </React.Fragment>
    );
  }
  readFile(fileList) {
    if (fileList && fileList[0] && this.state.name != '') {
      let formPayLoad = new FormData();
      formPayLoad.append('file', fileList[0]);
      formPayLoad.append('authenticity_token', this.props.authenticity_token);
      formPayLoad.append('name', this.state.name);
      this.uploadToServer(formPayLoad)
    } else {
      this.setState({error: 'Error: Missing image or image name!'})
    }
  }

  uploadToServer(payLoad){
    fetch('/images', {
      credentials: 'same-origin',
      headers: {},
      method: 'POST',
      body: payLoad
    })

    .then(response => {
      if(response['status'] == 204) {
        window.location.href = '/images'
      } else {
        this.setState({error: 'Error: the image could not be uploaded!'})
      }
    })
  }

}

ImageUploader.propTypes = {
  total: PropTypes.node,
  images_url: PropTypes.node,
  authenticity_token: PropTypes.node,
};
export default ImageUploader
